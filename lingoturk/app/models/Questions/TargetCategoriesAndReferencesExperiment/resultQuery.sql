SELECT fileName, listNumber, assignmentId, hitId, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'comment_id') as comment_id, (data->>'title_id') as title_id, (data->>'community_id') as community_id, (data->>'title_text') as title_text, (data->>'comment_text_a') as comment_text_a, (data->>'comment_text_b') as comment_text_b, (data->>'context') as context, (data->>'comment') as comment, (data->>'comment_number') as comment_number, (data->>'subthread_id') as subthread_id, (data->>'user_id') as user_id, (data->>'redirectUrl') as redirectUrl, (data->>'post_text') as post_text, id FROM (
	(SELECT * FROM Results WHERE experimentType='TargetCategoriesAndReferencesExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 482
ORDER BY partId, questionId, workerId