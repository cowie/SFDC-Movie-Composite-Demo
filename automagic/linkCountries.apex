List<Movie__c> movieList = [select id, external_id__c, temp_production_Country__c from Movie__c];
MovieNormalizerScripts.processCountryLinks(movieList);