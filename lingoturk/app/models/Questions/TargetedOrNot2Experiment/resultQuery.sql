SELECT fileName, listNumber, assignmentId, hitId, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'id') as id, (data->>'dataset') as dataset, (data->>'text') as text, (data->>'tokens') as tokens, (data->>'label') as label, id FROM (
	(SELECT * FROM Results WHERE experimentType='TargetedOrNot2Experiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE partid = 101
ORDER BY partId, questionId, workerId