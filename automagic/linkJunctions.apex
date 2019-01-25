List<Movie__c> movieList = [select id, name, external_id__c, temp_genre__c, temp_keyword__c, temp_production_country__c, temp_production_Company__c from Movie__c];
movieNormalizerScripts.processGenreLinks(movieList);
movieNormalizerScripts.processKeywordLinks(movieList);
movieNormalizerScripts.processCountryLinks(movieList);
movieNormalizerScripts.processCompanyLinks(movieList);