SELECT fileName, listNumber, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'listNr') as listNr, (data->>'index') as index, (data->>'sent') as sent, (data->>'sentence') as sentence, (data->>'sentence') as sentence, (data->>'sentence') as sentence, (data->>'statement') as statement, (data->>'statement') as statement, (data->>'n') as n, (data->>'sources') as sources, (data->>'html') as html, (data->>'sim') as sim, (data->>'true') as true, (data->>'completionUrl') as completionUrl, id FROM (
	(SELECT * FROM Results WHERE experimentType='NaturalLanguageInferenceExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 611
ORDER BY partId, questionId, workerId