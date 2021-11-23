require 'cloudinary'
require 'json'

desc "upload cloudinary image"
task cloudinary_upload: :environment do
    Cloudinary.config_from_url ENV["CLOUDINARY_URL"] 

    base64 = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAAyCAYAAACqECmXAAAAt0lEQVR42u3VQQ0AAAgEIE1u9PNlCDcoQacyBQC81kIHAKEDAEIHAIQOAAgdAIQOAAgdABA6ACB0ABA6ACB0AEDoAIDQAUDoAIDQAQChAwBCBwChAwBCBwCEDgAIHQCEDgAIHQAQOgAgdAAQOgAgdABA6ACA0AFA6ACA0AEAoQMAQgcAoQMAQgcAhA4ACB0AhA4ACB0AEDoAIHQAELrQAUDoAIDQAQChAwBCBwChAwBCBwCEDgCcBfuifJ09WpE9AAAAAElFTkSuQmCC"

    begin
        res = Cloudinary::Uploader.upload(base64)
        puts JSON.pretty_generate(res)
    rescue Excetion => e
        puts e.full_message
    end
end