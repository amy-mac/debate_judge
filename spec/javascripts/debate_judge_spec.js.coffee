#= require spec_helper
#= require debate_judge

describe 'DebateJudge', ->
  it "provides the 'DebateJudge' object", ->
    # Expect exists and is an object
    expect(DebateJudge).to.be.an("object")

    # Expect all namespace properties are present
    expect(DebateJudge).to.include.keys("Models", "Collections", "Views", "Routers")
