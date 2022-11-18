#!/bin/bash
echo hashtag_H, cluster_C_leader_user_id, relative_frequency_H_C, frequency_H_in_C, frequency_H_overall, count_H_in_C, count_tweets_in_C, count_H_entire_dataset, count_tweets_entire_dataset
total_hashtags_entire_dataset=$(grep type=retweeted downloaded_tweets_extend_nolf2.tsv | cut -f4 | sed 's/[""]//g' | tr '[:upper:]' '[:lower:]' | tr , '\n' |  wc | awk '{print $1}')
total_hashtags_in_cluster=$(cut -f2 filtered_final_tweets.tsv |  sed 's/[""]//g' | tr '[:upper:]' '[:lower:]' | tr , '\n' | sort | wc | awk '{print $1}')
for i in `cat found_hashtags.tsv`
do
        leader_user_id=$(grep -E -w "$i" filtered_final_tweets.tsv | cut -f1 | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')
        count_hashtags_entire_dataset=$(grep type=retweeted downloaded_tweets_extend_nolf2.tsv | cut -f4  | tr '[:upper:]' '[:lower:]'| grep -E -w "$i" | wc | awk '{print $1}')
        count_hashtags_in_cluster=$(grep -E -w "$i" filtered_final_tweets.tsv | wc | awk '{print $1}')
        frequency_H_in_C=$(echo $count_hashtags_in_cluster / $total_hashtags_in_cluster | bc -l)
        frequency_H_overall=$(echo $count_hashtags_entire_dataset / $total_hashtags_entire_dataset | bc -l)
        relative_frequency_H_C=$(echo $frequency_H_in_C / $frequency_H_overall | bc -l)


        echo $i, $leader_user_id, $relative_frequency_H_C, $frequency_H_in_C, $frequency_H_overall, $count_hashtags_in_cluster, $total_hashtags_in_cluster, $count_hashtags_entire_dataset, $total_hashtags_entire_dataset

done

