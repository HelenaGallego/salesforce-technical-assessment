// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

List<Team__c> teams = new List<Team__c>();

Team__c team = new Team__c();
team.External_Id__c = 1;
team.Abbreviation__c = 'ATL';
team.City__c = 'Atlanta';
team.Conference__c = 'East';
team.Division__c = 'Southeast';
team.Full_Name__c = 'Atlanta Hawks';
team.Name = 'Hawks';
teams.add(team);

team = new Team__c();
team.External_Id__c = 2;
team.Abbreviation__c = 'BOS';
team.City__c = 'Boston';
team.Conference__c = 'East';
team.Division__c = 'Atlantic';
team.Full_Name__c = 'Boston Celtics';
team.Name = 'Celtics';
teams.add(team);

team = new Team__c();
team.External_Id__c = 3;
team.Abbreviation__c = 'BKN';
team.City__c = 'Brooklyn';
team.Conference__c = 'East';
team.Division__c = 'Atlantic';
team.Full_Name__c = 'Brooklyn Nets';
team.Name = 'Nets';
teams.add(team);

team = new Team__c();
team.External_Id__c = 4;
team.Abbreviation__c = 'CHA';
team.City__c = 'Charlotte';
team.Conference__c = 'East';
team.Division__c = 'Southeast';
team.Full_Name__c = 'Charlotte Hornets';
team.Name = 'Hornets';
teams.add(team);

team = new Team__c();
team.External_Id__c = 5;
team.Abbreviation__c = 'CHI';
team.City__c = 'Chicago';
team.Conference__c = 'East';
team.Division__c = 'Central';
team.Full_Name__c = 'Chicago Bulls';
team.Name = 'Bulls';
teams.add(team);

team = new Team__c();
team.External_Id__c = 6;
team.Abbreviation__c = 'CLE';
team.City__c = 'Cleveland';
team.Conference__c = 'East';
team.Division__c = 'Central';
team.Full_Name__c = 'Cleveland Cavaliers';
team.Name = 'Cavaliers';
teams.add(team);

team = new Team__c();
team.External_Id__c = 7;
team.Abbreviation__c = 'DAL';
team.City__c = 'Dallas';
team.Conference__c = 'West';
team.Division__c = 'Southwest';
team.Full_Name__c = 'Dallas Mavericks';
team.Name = 'Mavericks';
teams.add(team);

team = new Team__c();
team.External_Id__c = 8;
team.Abbreviation__c = 'DEN';
team.City__c = 'Denver';
team.Conference__c = 'West';
team.Division__c = 'Northwest';
team.Full_Name__c = 'Denver Nuggets';
team.Name = 'Nuggets';
teams.add(team);

team = new Team__c();
team.External_Id__c = 9;
team.Abbreviation__c = 'DET';
team.City__c = 'Detroit';
team.Conference__c = 'East';
team.Division__c = 'Central';
team.Full_Name__c = 'Detroit Pistons';
team.Name = 'Pistons';
teams.add(team);

team = new Team__c();
team.External_Id__c = 10;
team.Abbreviation__c = 'GSW';
team.City__c = 'Golden State';
team.Conference__c = 'West';
team.Division__c = 'Pacific';
team.Full_Name__c = 'Golden State Warriors';
team.Name = 'Warriors';
teams.add(team);

team = new Team__c();
team.External_Id__c = 11;
team.Abbreviation__c = 'HOU';
team.City__c = 'Houston';
team.Conference__c = 'West';
team.Division__c = 'Southwest';
team.Full_Name__c = 'Houston Rockets';
team.Name = 'Rockets';
teams.add(team);

team = new Team__c();
team.External_Id__c = 12;
team.Abbreviation__c = 'IND';
team.City__c = 'Indiana';
team.Conference__c = 'East';
team.Division__c = 'Central';
team.Full_Name__c = 'Indiana Pacers';
team.Name = 'Pacers';
teams.add(team);

team = new Team__c();
team.External_Id__c = 13;
team.Abbreviation__c = 'LAC';
team.City__c = 'LA';
team.Conference__c = 'West';
team.Division__c = 'Pacific';
team.Full_Name__c = 'LA Clippers';
team.Name = 'Clippers';
teams.add(team);

team = new Team__c();
team.External_Id__c = 14;
team.Abbreviation__c = 'LAL';
team.City__c = 'Los Angeles';
team.Conference__c = 'West';
team.Division__c = 'Pacific';
team.Full_Name__c = 'Los Angeles Lakers';
team.Name = 'Lakers';
teams.add(team);

team = new Team__c();
team.External_Id__c = 15;
team.Abbreviation__c = 'MEM';
team.City__c = 'Memphis';
team.Conference__c = 'West';
team.Division__c = 'Southwest';
team.Full_Name__c = 'Memphis Grizzlies';
team.Name = 'Grizzlies';
teams.add(team);

team = new Team__c();
team.External_Id__c = 16;
team.Abbreviation__c = 'MIA';
team.City__c = 'Miami';
team.Conference__c = 'East';
team.Division__c = 'Southeast';
team.Full_Name__c = 'Miami Heat';
team.Name = 'Heat';
teams.add(team);

team = new Team__c();
team.External_Id__c = 17;
team.Abbreviation__c = 'MIL';
team.City__c = 'Milwaukee';
team.Conference__c = 'East';
team.Division__c = 'Central';
team.Full_Name__c = 'Milwaukee Bucks';
team.Name = 'Bucks';
teams.add(team);

team = new Team__c();
team.External_Id__c = 18;
team.Abbreviation__c = 'MIN';
team.City__c = 'Minnesota';
team.Conference__c = 'West';
team.Division__c = 'Northwest';
team.Full_Name__c = 'Minnesota Timberwolves';
team.Name = 'Timberwolves';
teams.add(team);

team = new Team__c();
team.External_Id__c = 19;
team.Abbreviation__c = 'NOP';
team.City__c = 'New Orleans';
team.Conference__c = 'West';
team.Division__c = 'Southwest';
team.Full_Name__c = 'New Orleans Pelicans';
team.Name = 'Pelicans';
teams.add(team);

team = new Team__c();
team.External_Id__c = 20;
team.Abbreviation__c = 'NYK';
team.City__c = 'New York';
team.Conference__c = 'East';
team.Division__c = 'Atlantic';
team.Full_Name__c = 'New York Knicks';
team.Name = 'Knicks';
teams.add(team);

team = new Team__c();
team.External_Id__c = 21;
team.Abbreviation__c = 'OKC';
team.City__c = 'Oklahoma City';
team.Conference__c = 'West';
team.Division__c = 'Northwest';
team.Full_Name__c = 'Oklahoma City Thunder';
team.Name = 'Thunder';
teams.add(team);

team = new Team__c();
team.External_Id__c = 22;
team.Abbreviation__c = 'ORL';
team.City__c = 'Orlando';
team.Conference__c = 'East';
team.Division__c = 'Southeast';
team.Full_Name__c = 'Orlando Magic';
team.Name = 'Magic';
teams.add(team);

team = new Team__c();
team.External_Id__c = 23;
team.Abbreviation__c = 'PHI';
team.City__c = 'Philadelphia';
team.Conference__c = 'East';
team.Division__c = 'Atlantic';
team.Full_Name__c = 'Philadelphia 76ers';
team.Name = '76ers';
teams.add(team);

team = new Team__c();
team.External_Id__c = 24;
team.Abbreviation__c = 'PHX';
team.City__c = 'Phoenix';
team.Conference__c = 'West';
team.Division__c = 'Pacific';
team.Full_Name__c = 'Phoenix Suns';
team.Name = 'Suns';
teams.add(team);

team = new Team__c();
team.External_Id__c = 25;
team.Abbreviation__c = 'POR';
team.City__c = 'Portland';
team.Conference__c = 'West';
team.Division__c = 'Northwest';
team.Full_Name__c = 'Portland Trail Blazers';
team.Name = 'Trail Blazers';
teams.add(team);

team = new Team__c();
team.External_Id__c = 26;
team.Abbreviation__c = 'SAC';
team.City__c = 'Sacramento';
team.Conference__c = 'West';
team.Division__c = 'Pacific';
team.Full_Name__c = 'Sacramento Kings';
team.Name = 'Kings';
teams.add(team);

team = new Team__c();
team.External_Id__c = 27;
team.Abbreviation__c = 'SAS';
team.City__c = 'San Antonio';
team.Conference__c = 'West';
team.Division__c = 'Southwest';
team.Full_Name__c = 'San Antonio Spurs';
team.Name = 'Spurs';
teams.add(team);

team = new Team__c();
team.External_Id__c = 28;
team.Abbreviation__c = 'TOR';
team.City__c = 'Toronto';
team.Conference__c = 'East';
team.Division__c = 'Atlantic';
team.Full_Name__c = 'Toronto Raptors';
team.Name = 'Raptors';
teams.add(team);

team = new Team__c();
team.External_Id__c = 29;
team.Abbreviation__c = 'UTA';
team.City__c = 'Utah';
team.Conference__c = 'West';
team.Division__c = 'Northwest';
team.Full_Name__c = 'Utah Jazz';
team.Name = 'Jazz';
teams.add(team);

team = new Team__c();
team.External_Id__c = 30;
team.Abbreviation__c = 'WAS';
team.City__c = 'Washington';
team.Conference__c = 'East';
team.Division__c = 'Southeast';
team.Full_Name__c = 'Washington Wizards';
team.Name = 'Wizards';
teams.add(team);

insert teams;
