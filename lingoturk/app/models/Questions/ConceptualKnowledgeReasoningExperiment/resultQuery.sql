SELECT fileName, listNumber, assignmentId, hitId, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'quid') as quid, (data->>'description') as description, (data->>'exampleTrue') as exampleTrue, (data->>'exampleFalse') as exampleFalse, (data->>'run') as run, (data->>'subList') as subList, (data->>'completionUrl') as completionUrl, (data->>'triple') as triple, (data->>'name') as name, id FROM (
	(SELECT * FROM Results WHERE experimentType='ConceptualKnowledgeReasoningExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 561
ORDER BY partId, questionId, workerId