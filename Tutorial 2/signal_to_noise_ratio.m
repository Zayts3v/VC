function snr_noise = signal_to_noise_ratio(original, noise_img)
    image_var = 0.0;
    noise_var = 0.0;
    original = double(original);
    noise_img = double(noise_img);
    [l,c,~]= size(original);
    media= mean2(original);

    for i=1:l
        for j=1:c
            image_var = image_var + (noise_img(i,j)-media).^2;
            noise_var = noise_var + (noise_img(i,j)-original(i,j)).^2;
        end
    end

    snr_noise = 10*log10(image_var/noise_var);
end

