SELECT fileName, listNumber, assignmentId, hitId, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'comment_ids') as comment_ids, (data->>'title_id') as title_id, (data->>'community_id') as community_id, (data->>'title_text') as title_text, (data->>'comment_text') as comment_text, (data->>'redirectUrl') as redirectUrl, id FROM (
	(SELECT * FROM Results WHERE experimentType='SociallyAcceptableOrNotExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 281
ORDER BY partId, questionId, workerId