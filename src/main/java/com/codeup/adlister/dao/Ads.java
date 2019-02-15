package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // search ads by title / description
    List<Ad> searchAds(String searchQuery);
    // Show Owner's Ads
    List<Ad> ownerAds(Long user_id);
    // sets categories of an ad given it's id upon ad creation
    void setAdCategory(Long adId, String[] array);
    // Filter ads by category
    List<String> getCategoriesOfAd(Long ad_id);

}
