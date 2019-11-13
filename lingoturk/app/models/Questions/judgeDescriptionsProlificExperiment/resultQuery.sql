SELECT workerId, timestamp, partId, questionId, answer::TEXT, (data->>'quid') as quid, (data->>'description') as description, (data->>'subList') as subList, id FROM (
	(SELECT * FROM Results WHERE experimentType='judgeDescriptionsProlificExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 362
ORDER BY partId, questionId, workerId