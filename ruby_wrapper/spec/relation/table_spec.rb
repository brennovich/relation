require 'spec_helper'

module Relation
  describe Table do
    
    let(:users) { Table.new('users') }
    let(:developers) { Table.new('developers') }
    
    describe '#name' do
      
      it "should return the name of the table" do
        users.name.should == "users"
      end
      
      it "should return the table name" do
        developers.name.should == "developers"
      end
      it "should return the table name of a long table" do
        table = Table.new("who_wants_to_live_forever_who_dares_to_love_forever")
        table.name.should == "who_wants_to_live_forever_who_dares_to_love_forever"
      end
    end
    
    describe '#select' do
      it "should be possible to pass String" do
        users.select("*").to_sql.should == "SELECT * FROM users"
      end
      
      it "should be possible to pass projections in a chain methods" do
        users.select("name").select("email").to_sql.should == "SELECT name,email FROM users"
      end
      
      it "should be possible to pass a SqlLiteral" do
        users.select(Relation::Nodes::SqlLiteral.new('name')).to_sql.should == "SELECT name FROM users"
      end
      
      it "should be possible to pass many Sql Literals" do
        pending
        users.select(SqlLiteral.new('password'), SqlLiteral.new('password_confirmation')).to_sql.should == "SELECT password,password_confirmation FROM users"
      end
      
    end
    
    describe '#limit' do
      it "should add a limit number" do
        users.limit(1).to_sql.should == "SELECT FROM users LIMIT 1"
      end
      it "should add a high limit number" do
        pending
        users.limit(10_000_000_000).to_sql.should == "SELECT FROM users LIMIT 10000000000"
      end
    end
    
    describe '#where' do
      
    end
    
    describe 'putting_all_together' do
      it "should pass limit before select" do
        users.limit(10).select('name').to_sql.should == "SELECT name FROM users LIMIT 10"
      end
      it "should pass select before limit" do
        users.select('email').limit(9999999).to_sql.should == "SELECT email FROM users LIMIT 9999999"
      end
    end
    
  end
end