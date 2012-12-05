# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def build_from_json(raw_data, election_id)
  raw_data.each do |data|
    chinese_name = data["姓名"]

    committee = Committee.find_or_create_by_name(chinese_name)
    election_commitee = ElectionCommittee.create!(:election_id => election_id , :committee => committee )

    party_chinese_name = data["黨籍"]
    party = Party.find_or_create_by_name(party_chinese_name)
    committee.party = party

    party_group_chinese_name = data["黨團"]
    party_group = PartyGroup.find_or_create_by_name(party_group_chinese_name)
    committee.party_group = party_group
    committee.save

    puts "#{election_commitee.election_id} - #{committee.name } "
  end
end

for i in 1..8
  election = Election.create

  if i > 1
    json = JSON.parse(IO.read("doc/committee_raw/#{i}.json")) if i != 1
    build_from_json(json,i)
  end
end
