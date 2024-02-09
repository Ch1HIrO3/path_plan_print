class Schedule < ApplicationRecord
  def self.search(search)
    if search != ""
      Schedule.where(name: name, password: password)
    end
  end
end


# モデル.where('検索対象となるカラムを含む条件式')