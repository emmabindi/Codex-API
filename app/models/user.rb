class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :username, presence: true

  has_many :bookmarks, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :journals, dependent: :destroy
  has_many :timers, dependent: :destroy

  # Gets entries by date for bar graphs 
  def fetch_activity_by_date(type)
    public_send(type).group_by_day(
      :created_at,
      format: '%Y-%m-%d',
      range: 4.weeks.ago.midnight..Time.zone.now
    ).count
  end

  # Gets a hash containing the counts of the users activity and total of all types 
  def fetch_activities_by_date(*types)
  entries_array = []
    types.each_with_object({}) do | key, hash | 
      entries_array.push(hash[key] = fetch_activity_by_date(key)) 
    end
    total_entries_by_date = entries_array.inject { |memo, el| memo.merge(el) { |_k, old_v, new_v| old_v + new_v } }
  end

  # Gets the count of entries by category 
  def fetch_activity_by_category(type)
    public_send(type).joins(:category).group(:name).count(:name)
  end

  # Gets a hash containing the total of all activity by category 
  def fetch_activities_by_category(*types)
    entries_array = []
    types.each_with_object({}) do | key, hash |
      entries_array.push(hash[key] = fetch_activity_by_category(key))
    end
    total_entries_by_category = entries_array.inject { |memo, el| memo.merge(el) { |_k, old_v, new_v| old_v + new_v } }
  end

    # Gets the count of entries by language 
    def fetch_activity_by_language(type)
      public_send(type).joins(:language).group(:name).count(:name)
    end
  
    # Gets a hash containing the total of all activity by category 
    def fetch_activities_by_language(*types)
      entries_array = []
      types.each_with_object({}) do | key, hash |
        entries_array.push(hash[key] = fetch_activity_by_language(key))
      end
      total_entries_by_language = entries_array.inject { |memo, el| memo.merge(el) { |_k, old_v, new_v| old_v + new_v } }
    end
end











# returns a hash however I want an array with a hash inside
# alternative merge method though
# def fetch_activities(*types)
#   types.each_with_object({}) do |key, hash|
#     hash[key] = fetch_activity(key)
#   end.then do |hash|
#     hash.merge(total_entries_by_date: hash.values.sum)
#   end
# end