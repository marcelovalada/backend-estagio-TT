require "httparty"

describe "GET /User" do
  it "Consulta da lista de Usuarios" do

    response = HTTParty.get(
      "http://127.0.0.1:3000/users",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2ODM4NjA3NzB9.OSju8RzbRqYz0F0M__c0MdR1YEnwKI6qb39tDH9nCF0"
      },
     )

      #espera que a resposta seja ok (200)
      expect(response.code).to eql 200

  end
end
