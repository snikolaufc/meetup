defmodule Meetup.Person do
  use PowerAssert
  doctest Meetup.Person

  test "stores values by key" do
    {:ok, bucket} = KV.Bucket.start_link
    assert Meetup.Person.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end
end
