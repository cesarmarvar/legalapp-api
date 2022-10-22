# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Speciality.delete_all

specialities = [
  "civil",
  "penal",
  "familia",
  "laboral", 
  "ambiental", 
  "comercial", 
  "propiedad intelectual", 
  "marcas",
  "registral",
  "notarial", 
  "inmobiliario", 
  "contratos", 
  "tributario", 
  "energía", 
  "constitucional", 
  "internacional", 
  "administrativo", 
  "migratorio", 
  "marítimo", 
  "aduanero", 
  "arbitraje", 
  "procesal civil", 
  "procesal penal", 
  "procesal constitucional", 
  "accidentes", 
  "medicina", 
  "aeronáutico",
  "bancario",
  "agro",
  "minero",
  "salud y seguridad",
  "seguros",
  "política",
  "contratación pública",
  "consumidor",
  "fusiones y adquisiciones",
  "compliance",
  "startups"
]

specialities.map do |spec| 
  n = 1
  especialidad = Speciality.new(speciality: spec)
  n += 1

  if especialidad.save
    puts "speciality #{n} succesfully created"
  else
    puts "speciality #{n} #{spec.errors.full_messages.join(", ")}"
  end

end