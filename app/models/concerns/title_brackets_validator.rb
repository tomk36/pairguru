class TitleBracketsValidator < ActiveModel::Validator

    def validate(record)
            @title = record.title
            def parenth(string)
                i=0; j=0; k=0
                    string.split("").each do |str|
                      i+=1 if str == "("
                      i-=1 if str == ")"
                      j+=1 if str == "["
                      j-=1 if str == "]"   
                      k+=1 if str == "{"
                      k-=1 if str == "}"
                      break if (i<0 or k<0 or j<0)
                    end
                (i==0 && j==0 && k==0) && !string.include?("()") ? true : false
            end
        record.errors.add(:base, "has invalid title") if !parenth(@title)
    end
end 