+++
title = "Superior Highly Composite Number"
date = 2025-04-25
lastmod = 2025-04-25
tags = ["kafka", "math"]
draft = true
+++

TODO:
- Explore limit > request to ensure balance when some consumers have more partitions than others.
- In first post, propose superior highly copmposite number.
- In next post, propose step scale up. For example, if partition count is 12, then possible replicas = [1, 2, 3, 4, 6, 12] (divisors of 12, to make sure replicas have same input scale).
- In next post, propose VPA. Also, discuss about canary.

[Superior highly composite number](https://en.wikipedia.org/wiki/Superior_highly_composite_number) is a concept from math which means
a number which has many divisors.

This is a nifty information that can be used in software engineering.

For example, it is a good idea to use a superior highly composite number for the number
of partitions for a kafka topic.

Why though?

In kafka, one topic can be consumed by only one consumer group member.

TODO - add info graphic

TODO - add table with replica count and partition / replica for num-partition = 7.
TODO - add table with replica count and partition / replica for num-partition = 12.
