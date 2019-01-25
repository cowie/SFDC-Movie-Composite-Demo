List<Movie__c> movieList = [select id, external_id__c, temp_production_Company__c from Movie__c];
MovieNormalizerScripts.processCompanyLinks(movieList);