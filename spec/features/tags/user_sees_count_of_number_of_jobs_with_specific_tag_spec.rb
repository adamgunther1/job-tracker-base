require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees the tags associated with that specific job and how many other jobs have that tag" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job1 = company.jobs.create!(title: "Project Manager", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "CEO", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create!(name: "fun")
    tag2 = Tag.create!(name: "arduous")
    job.tags << tag1
    job.tags << tag2
    job1.tags << tag1
    job1.tags << tag2
    job2.tags << tag2


    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content("fun - 2")
    expect(page).to have_content("arduous - 3")

    visit company_job_path(company, job2)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("CEO")
    expect(page).to have_content("70")
    expect(page).to have_content("arduous - 3")   
  end
end
