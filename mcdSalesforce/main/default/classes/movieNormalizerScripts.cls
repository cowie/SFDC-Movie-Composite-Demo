public class movieNormalizerScripts {

    private class midObj{
        public string id;
        public string name;
        public string iso_3166_1;
        public string gender;
        public integer order;
        public string credit_id;
        public string character;
        public string cast_id;
    }

    public static void processTalentLinks (List<Movie__c> mList){
        /*
            For each movie
            Grab the list of JSON items in the array
            Create 1 Cast__c per item against the movie
            Add to the Cast__c list, move it along.
            Ignore that I probably coulda just written this to overload. I'm lazy. C+P is easier.
        */
        List<Cast__c> mgList = new list<Cast__c>();
        for(Movie__c m : mList){
            string movieID = m.External_Id__c;
            string jsonArray = m.temp_cast__c;
            List<midObj> midList = (List<midObj>)JSON.deserialize(jsonArray, List<midObj>.class);
            for(midObj o : midList){
                Talent__c g = new Talent__c(External_Id__c=o.id);

                Cast__c mg = new Cast__c(Movie__c = m.id, Talent__r = g, gender__c = o.gender, 
                                        order__c = o.order, credit_id__c = o.credit_id, 
                                        character__c = o.character, cast_id__c = o.cast_id);
                if(mg.credit_id__c !=null)
                    mgList.add(mg);
            }
        }
        try{
        insert mgList;
        }catch(DMLException e){
            system.debug(e.getMessage());
        }
    }

    public static void processGenreLinks (List<Movie__c> mList){
        /*
        For each movie
        Grab the list of JSON items in the array
        Create 1 MovieGenre__c per item against the movie
        Add to the MovieGenre__c list, move it along.
        */
        List<MovieGenre__c> mgList = new list<MovieGenre__c>();
        for(Movie__c m : mList){
            string movieID = m.External_Id__c;
            string jsonArray = m.Temp_Genre__c;
            List<midObj> midList = (List<midObj>)JSON.deserialize(jsonArray, List<midObj>.class);
            for(midObj o : midList){
                Genre__c g = new Genre__c(External_Id__c=o.id);
                MovieGenre__c mg = new MovieGenre__c(Movie__c = m.id, Genre__r = g);
                mgList.add(mg);
            }
        }
        try{
        insert mgList;
        }catch(DMLException e){
            system.debug(e.getMessage());
        }
    }

    public static void processKeywordLinks (List<Movie__c> mList){
        /*
        For each movie
        Grab the list of JSON items in the array
        Create 1 MovieKeyword__c per item against the movie
        Add to the MovieKeyword__c list, move it along.
        Ignore that I probably coulda just written this to overload. I'm lazy. C+P is easier.
        */
        List<MovieKeyword__c> mgList = new list<MovieKeyword__c>();
        for(Movie__c m : mList){
            string movieID = m.External_Id__c;
            string jsonArray = m.temp_keyword__c;
            List<midObj> midList = (List<midObj>)JSON.deserialize(jsonArray, List<midObj>.class);
            for(midObj o : midList){
                Keyword__c g = new Keyword__c(External_Id__c=o.id);
                MovieKeyword__c mg = new MovieKeyword__c(Movie__c = m.id, Keyword__r = g);
                mgList.add(mg);
            }
        }
        try{
        insert mgList;
        }catch(DMLException e){
            system.debug(e.getMessage());
        }
    }

    public static void processCompanyLinks (List<Movie__c> mList){
        /*
        For each movie
        Grab the list of JSON items in the array
        Create 1 MovieKeyword__c per item against the movie
        Add to the MovieKeyword__c list, move it along.
        Ignore that I probably coulda just written this to overload. I'm lazy. C+P is easier.
        */
        List<MovieProductionCompany__c> mgList = new list<MovieProductionCompany__c>();
        for(Movie__c m : mList){
            string movieID = m.External_Id__c;
            string jsonArray = m.Temp_Production_Company__c;
            List<midObj> midList = (List<midObj>)JSON.deserialize(jsonArray, List<midObj>.class);
            for(midObj o : midList){
                Production_Company__c g = new Production_Company__c(External_Id__c=o.id);
                MovieProductionCompany__c mg = new MovieProductionCompany__c(Movie__c = m.id, Production_Company__r = g);
                mgList.add(mg);
            }
        }
        try{
        insert mgList;
        }catch(DMLException e){
            system.debug(e.getMessage());
        }
    }

    

    public static void processCountryLinks (List<Movie__c> mList){
        /*
        For each movie
        Grab the list of JSON items in the array
        Create 1 MovieKeyword__c per item against the movie
        Add to the MovieKeyword__c list, move it along.
        Ignore that I probably coulda just written this to overload. I'm lazy. C+P is easier.
        */
        List<MovieProductionCountry__c> mgList = new list<MovieProductionCountry__c>();
        for(Movie__c m : mList){
            string movieID = m.External_Id__c;
            string jsonArray = m.Temp_Production_Country__c;
            List<midObj> midList = (List<midObj>)JSON.deserialize(jsonArray, List<midObj>.class);
            for(midObj o : midList){
                Production_Country__c g = new Production_Country__c(iso_3166_1__c=o.iso_3166_1);
                MovieProductionCountry__c mg = new MovieProductionCountry__c(Movie__c = m.id, Production_Country__r = g);
                mgList.add(mg);
            }
        }
        try{
        insert mgList;
        }catch(DMLException e){
            system.debug(e.getMessage());
        }
    }
}