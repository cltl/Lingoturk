SELECT fileName, listNumber, assignmentId, hitId, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'quid') as quid, (data->>'description') as description, (data->>'exampleTrue') as exampleTrue, (data->>'exampleFalse') as exampleFalse, (data->>'run') as run, (data->>'completionUrl') as completionUrl, (data->>'triple') as triple, (data->>'name') as name, id FROM (
	(SELECT * FROM Results WHERE experimentType='ConceptualKnowledgeMultibatchExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 641
ORDER BY partId, questionId, workerId