require 'rails_helper'

RSpec.describe MediaContent, type: :model do
  it 'Returns Large Photo first' do
    photo = Photo.new
    photo.photo_sizes << PhotoSize.new(label: PhotoSize::LARGE,
                                      url: PhotoSize::LARGE)
    photo.photo_sizes << PhotoSize.new(label: PhotoSize::MEDIUM,
                                      url: PhotoSize::MEDIUM)
    photo.photo_sizes << PhotoSize.new(label: PhotoSize::SMALL,
                                      url: PhotoSize::SMALL)
    photo.save
    expect(photo.biggest_size_url).to eq(PhotoSize::LARGE)
  end

  it 'Returns Medium Photo as second option' do
    photo = Photo.new
    photo.photo_sizes << PhotoSize.new(label: PhotoSize::SMALL,
                                      url: PhotoSize::SMALL)
    photo.photo_sizes << PhotoSize.new(label: PhotoSize::MEDIUM,
                                      url: PhotoSize::MEDIUM)
    photo.save
    expect(photo.biggest_size_url).to eq(PhotoSize::MEDIUM)
  end

  it 'Returns original when none available' do
    photo = Photo.new
    photo.photo_sizes << PhotoSize.new(label: PhotoSize::ORIGINAL,
                                      url: PhotoSize::ORIGINAL)
    photo.photo_sizes << PhotoSize.new(label: PhotoSize::SMALL,
                                      url: PhotoSize::SMALL)
    photo.save
    expect(photo.biggest_size_url).to eq(PhotoSize::ORIGINAL)
  end

  it 'Returns empty string when none available' do
    photo = Photo.new
    photo.save
    expect(photo.biggest_size_url).to eq("")
  end
end
