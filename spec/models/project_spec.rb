require 'rails_helper'

describe Project do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :link }
  it { should belong_to :skill }
end
