module onchain_bio_addr::onchain_bio {
  use std::string::{String};
  use std::signer;

  struct Bio has key, store, drop {
      name: String,
      bio: String,
  }
  
  #[view]
  public fun signature() : address {
      @0x60844efedb533ff6fc33f81728abb34ea65ed5e070a1068a2db5ee94bb57b52f
  }

  public entry fun register(account: &signer, name: String, bio: String) acquires Bio {
    // Check if a Bio already exists for the account
    if (exists<Bio>(signer::address_of(account))) {
      // Remove the existing Bio
      let _old_Bio = move_from<Bio>(signer::address_of(account));
    };
    // Create the new Bio
    let bio = Bio {
      name,
      bio,
    };
    // Store the new Bio under the account
    move_to<Bio>(account, bio);
  }
}