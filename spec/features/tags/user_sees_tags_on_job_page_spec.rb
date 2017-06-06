require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees the tags associated with that specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job.tags << Tag.create(name: "fun")
    job.tags << Tag.create(name: "arduous")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("fun")
    expect(page).to have_content("arduous")
  end
end
