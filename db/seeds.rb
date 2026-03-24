# Create a default user
user = User.find_or_create_by!(email_address: "family@example.com") do |u|
  u.password = "password"
  u.password_confirmation = "password"
end

puts "Clearing existing data..."
Entry.destroy_all
StoryThread.destroy_all
Chapter.destroy_all

puts "Seeding Family Story Timeline..."

# --- 2024 ---

chapter_2024_1 = Chapter.create!(
  title: "New Apartment Move-in",
  description: "Finally got the keys! A big step for us starting our life in the city.",
  start_date: Date.new(2024, 2, 1),
  end_date: Date.new(2024, 2, 15),
  published: true
)
thread_2024_1 = StoryThread.create!(chapter: chapter_2024_1, title: "Moving Day Logistics")
3.times { |i| Entry.create!(user: user, story_thread: thread_2024_1, body: "Entry #{i+1}: Carrying boxes up three flights of stairs is no joke!") }

chapter_2024_2 = Chapter.create!(
  title: "Summer in Italy",
  description: "A dream milestone trip. Two weeks of pasta, history, and sun across Rome, Florence, and Amalfi.",
  start_date: Date.new(2024, 6, 10),
  end_date: Date.new(2024, 6, 25),
  published: true
)
["Rome Adventures", "Florence Art", "Amalfi Coast Sun"].each do |thread_title|
  thread = StoryThread.create!(chapter: chapter_2024_2, title: thread_title)
  20.times { |i| Entry.create!(user: user, story_thread: thread, body: "Beautiful memory #{i+1} from #{thread_title}. The food was incredible and the views were even better.") }
end

# --- 2025 ---

chapter_2025_1 = Chapter.create!(
  title: "The Bathroom Remodel",
  description: "As mentioned in our spec! Turning the 1970s blue tile into a modern spa retreat.",
  start_date: Date.new(2025, 3, 5),
  end_date: Date.new(2025, 4, 10),
  published: true
)
thread_2025_1 = StoryThread.create!(chapter: chapter_2025_1, title: "Demolition & Progress")
12.times { |i| Entry.create!(user: user, story_thread: thread_2025_1, body: "Update #{i+1}: Progress is slow but it's looking great. Found some old newspapers behind the wall today!") }

chapter_2025_2 = Chapter.create!(
  title: "Weekend at the Lake",
  description: "Quick getaway to the mountains to recharge.",
  start_date: Date.new(2025, 8, 15),
  end_date: Date.new(2025, 8, 17),
  published: true
)
thread_2025_2 = StoryThread.create!(chapter: chapter_2025_2, title: "Cabin Vibes")
2.times { |i| Entry.create!(user: user, story_thread: thread_2025_2, body: "So peaceful here. Just us and the birds.") }

# --- 2026 ---

chapter_2026_1 = Chapter.create!(
  title: "Oregon Coast Trip",
  description: "Road trip down Highway 101. Haystack Rock, lighthouses, and lots of clam chowder.",
  start_date: Date.new(2026, 1, 12),
  end_date: Date.new(2026, 1, 20),
  published: true
)
thread_2026_1 = StoryThread.create!(chapter: chapter_2026_1, title: "Cannon Beach Stops")
18.times { |i| Entry.create!(user: user, story_thread: thread_2026_1, body: "Day #{i+1} at the coast. The weather was moody but perfect for photos.") }

chapter_2026_2 = Chapter.create!(
  title: "Daily Life: Spring 2026",
  description: "Capturing the little moments of our routine this season.",
  start_date: Date.new(2026, 3, 1),
  end_date: Date.new(2026, 5, 31),
  published: true
)
thread_2026_2 = StoryThread.create!(chapter: chapter_2026_2, title: "Garden Progress")
5.times { |i| Entry.create!(user: user, story_thread: thread_2026_2, body: "The tomatoes are finally starting to sprout! Entry ##{i+1}") }

puts "Done! Seeding complete. Created #{Chapter.count} chapters with #{Entry.count} total entries."
