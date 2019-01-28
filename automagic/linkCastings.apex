List<Movie__c> movieList = [select id, name, external_id__c, temp_cast__c from Movie__c];
movieNormalizerScripts.processTalentLinks(movieList);