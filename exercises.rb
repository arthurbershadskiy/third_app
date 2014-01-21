person1 = {first: "Papa", last: "Bear"}
person2 = {first: "Mama", last: "Bear"}
person3 = {first: "Baby", last: "Bear"}

params = {}

params.inject(&:merge)


