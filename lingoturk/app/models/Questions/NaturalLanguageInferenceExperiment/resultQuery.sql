SELECT fileName, listNumber, workerId, origin, timestamp, partId, questionId, answer::TEXT, (data->>'listNr') as listNr, (data->>'index') as index, (data->>'sent_id') as sent_id, (data->>'sentence') as sentence, (data->>'sentence_statement') as sentence_statement, (data->>'sentence_predicate') as sentence_predicate, (data->>'statement') as statement, (data->>'statement_sent_ids') as statement_sent_ids, (data->>'n_sources') as n_sources, (data->>'sources') as sources, (data->>'html_sources') as html_sources, (data->>'sim') as sim, (data->>'true_answer') as true_answer, (data->>'completionUrl') as completionUrl, id FROM (
	(SELECT * FROM Results WHERE experimentType='NaturalLanguageInferenceExperiment') as tmp1
	LEFT OUTER JOIN Questions USING (QuestionId)
	LEFT OUTER JOIN Groups USING (PartId)
) as tmp
WHERE LingoExpModelId = 641
ORDER BY partId, questionId, workerId