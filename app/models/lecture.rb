class Lecture < ApplicationRecord
set_primary_key "lecid"
belongs_to:user
validates:lecid,presence:true
validates:time, presence:true
validates:suite,presence:true
validates:title,length: { minimum: 2, maximum: 50 }
validates:string,presence:true
validates:text,length{ maximum: 500 }
validates:userid,presence:true
end
