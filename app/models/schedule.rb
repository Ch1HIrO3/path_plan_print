class Schedule < ApplicationRecord
  def self.search(name, password)
    if name.present? && password.present?
      Schedule.where(name: name, password: password)
    end
  end
end


# モデル.where('検索対象となるカラムを含む条件式')