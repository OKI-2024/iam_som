class WinesController < ApplicationController
    

  def show
    @wine = Wine.find(params[:id])
    @reviews = @wine.reviews
  end
  
  def search
    @wines = Wine.all
  
    # 入力されたキーワードを処理
    if params[:keyword].present?
      # 平仮名をカタカナに変換し、全角英数字を半角に変換
      keyword_processed = Moji.hira_to_kata(params[:keyword])
      keyword_processed = Moji.zen_to_han(keyword_processed, Moji::ZEN_ALNUM)  # 全角英数字を半角に
      @keywords = Moji.han_to_zen(keyword_processed, Moji::KANA)
    else
      @keywords = ""
    end
  
    @type_names = Type.where(id: params[:type_ids]).pluck(:name).join(", ")
    @region_names = Region.where(id: params[:region_ids]).pluck(:name).join(", ")
    @grape_variety_names = GrapeVariety.where(id: params[:grape_variety_ids]).pluck(:name).join(", ")
  
    # 検索条件がある場合のみwhere句を使って絞り込み
    if @keywords.present?
      @wines = @wines.joins("LEFT JOIN reviews ON reviews.wine_id = wines.id")
                     .where("wines.name LIKE :keyword OR wines.producer LIKE :keyword OR reviews.content LIKE :keyword", keyword: "%#{@keywords}%")
    end
  
    # その他の検索条件
    @wines = @wines.where(type_id: params[:type_ids]) if params[:type_ids].present?
    @wines = @wines.where(region_id: params[:region_ids]) if params[:region_ids].present?
    @wines = @wines.where(grape_variety_id: params[:grape_variety_ids]) if params[:grape_variety_ids].present?
    
    @wines = @wines.distinct
  
    render 'search'
  end
  
  

  def autocomplete
    term = params[:term].downcase
    wines = Wine.where("LOWER(name) LIKE :term OR LOWER(producer) LIKE :term", term: "%#{term}%").select(:name, :producer).distinct
    names = wines.map { |wine| { label: "ワイン名: #{wine.name}", value: wine.name } }
    producers = wines.map { |wine| { label: "生産者名: #{wine.producer}", value: wine.producer } }.uniq
    result = names + producers
    render json: result.uniq { |item| item[:value] }
  end
  
end
