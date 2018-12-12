class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.search(terms)
    questions = self.all
    if terms != nil
      if terms[:cathegory] != "todas las categorías"
        questions = where('cathegory LIKE ?', "%#{terms[:cathegory]}%").order('id DESC')
      end
      if terms[:title] != ""
        ret = Array.new
        words = terms[:title].split
        words.each do |word|
          ret = ret | where('title LIKE ?', "%#{word}%").order('id DESC')
        end
        questions = ret
      end
      questions.sort_by { |q| q[:rep] }.reverse!
    end
  end
end
