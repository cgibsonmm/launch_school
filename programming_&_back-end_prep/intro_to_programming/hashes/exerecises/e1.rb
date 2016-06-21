# Given

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immeditate_familly = family.select do |k, v|
  k == :sisters || k == :brothers
end

arr = immeditate_familly.values.flatten

p arr
