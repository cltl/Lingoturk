SELECT fileName, listNumber, assignmentId, hitId, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'comment_id') as comment_id, (data->>'title_id') as title_id, (data->>'community_id') as community_id, (data->>'title_text') as title_text, (data->>'comment_text') as comment_text, (data->>'context') as context, (data->>'comment') as comment, (data->>'redirectUrl') as redirectUrl, id FROM (
	(SELECT * FROM Results WHERE experimentType='InappropriateLanguageInContextExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 327
ORDER BY partId, questionId, workerId