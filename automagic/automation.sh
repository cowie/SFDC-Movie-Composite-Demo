#batcher
sfdx force:org:create -f config/project-scratch-def.json -s -a movieDevOrg -d 7
sfdx force:source:push
sfdx force:user:permset:assign -n MovieAppPermSet
sfdx force:data:bulk:upsert -s Production_Country__c -f data/prepared/Production_Country__c.csv -i iso_3166_1__c -w 1
sfdx force:data:bulk:upsert -s Production_Company__c -f data/prepared/Production_Company__c.csv -i external_id__c -w 1
sfdx force:data:bulk:upsert -s Genre__c -f data/prepared/Genre__c.csv -i external_id__c -w 1
sfdx force:data:bulk:upsert -s Keyword__c -f data/prepared/Keyword__c.csv -i external_id__c -w 1
sfdx force:data:bulk:upsert -s Movie__c -f data/prepared/Movie__c.csv -i external_id__c -w 1
sfdx force:data:bulk:upsert -s Talent__c -f data/prepared/Talent__c.csv -i external_id__c -w 2
sfdx force:apex:execute -f automagic/linkJunctions.apex
sfdx force:apex:execute -f automagic/linkCastings.apex