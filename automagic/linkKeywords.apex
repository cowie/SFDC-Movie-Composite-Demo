List <Movie__c> movieList = [select id, external_id__c, temp_keyword__c, name from Movie__c];
MovieNormalizerScripts.processKeywordLinks(movieList);