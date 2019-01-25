List<Movie__c> movieList = [select id, external_id__c, temp_genre__c from Movie__c];
MovieNormalizerScripts.processGenreLinks(movieList);