require "httparty"

describe "POST /User" do
  it "Criar novo usuario" do

    #Criação de um payload para enviar no body
    payload = {
      name: "teste55",
      password_digest: "123456789",
      email: "teste55@gmail.com",
      cpf: "222.222.222-44"
    }

    response = HTTParty.post(
      "http://127.0.0.1:3000/users",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2ODM4NjA3NzB9.OSju8RzbRqYz0F0M__c0MdR1YEnwKI6qb39tDH9nCF0"
      },
     )

      expect(response.code).to eql 201

  end
end
