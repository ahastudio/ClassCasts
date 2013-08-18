class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :grades, :dependent => :destroy
  has_many :questions, :dependent => :destroy, :order => 'created_at desc'
  has_many :answers, :through => :questions
  accepts_nested_attributes_for :questions, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true

  attr_accessible :attpmpts, :description, :name, :questions_attributes

end

