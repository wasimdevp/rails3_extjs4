class Gundam < ActiveRecord::Base
  include MongoSync
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_and_belongs_to_many :drivers, join_table: "driver_gundams"
  has_and_belongs_to_many :forces, join_table: "force_gundams"
  belongs_to :period
  belongs_to :usage
  
	attr_accessible :name, :name_chs, :model, :period_id, :period, :usage_id, :usage
  
  validates :model, :uniqueness => { :scope => :period_id, :message => "should have only one model per period" }, :on => :create


  def self.search_by_keywords(params = {})
    tire.search(page: params[:page], per_page: params[:per_page]) do |search|
         search.query do |q|
         #q.match([:event, :message], params[:query]) if params[:query].present?
         q.string params[:query] if params[:query].present?
        end
        #search.filter :term, category_id: params[:category_id] if params[:category_id].present?
        search.sort { by :updated_at, "desc" } if params[:query].blank?
      # raise to_curl
    end
  end

  # indexes 
  mapping do
    indexes :id,           index: :not_analyzed
    indexes :name
    indexes :name_chs
    indexes :model
    indexes :updated_at,   type: 'date', include_in_all: false
  end

end
