# Benchmarks for form validators

These benchmarks measure:
- how fast input hashes matching the specification can be validated at runtime

These benchmarks don't (currently?) measure:
- validation failure speed
- compilation time overhead

Object construction is part of the benchmark, but can be skipped if certain
validator implementation does not require it or is built in a way that makes it
persistent during its intended workflow.

## Example results

(https://bbrtj.eu/blog/article/validation-frameworks-benchmark)

## Running the benchmark

First, you have to install Carmel or Carton for your perl and use it to install dependencies locally:

```
cpan Carmel
carmel install
```

The benchmark is run one case at a time:

```
carmel exec ./benchmark.pl <case_name>
```

## Cases

Here is the list of current benchmark cases with rationales behind them:

### single_field

We pass a single field `a`, which is required and can be any scalar value.

*Rationale*: we measure the runtime overhead each system has. The validation rule here is as easy as it can be on purpose. Results of this benchmark can be used to decide whether a validator should be used for simple data validation cases that will run very frequently.

### build_object

The same as `single_field`, but we do not cache the validation object and let it rebuild from scratch.

*Rationale*: we measure the object construction overhead for each system. Some systems may "cheat" this benchmark by pinning validation data to the class and not the object. Results of this benchmark can be used to determine which framework is faster in a scenario where the validation object cannot be kept in memory for long-term reuse.

### multiple_fields

We pass five fields `a`, `b`, `c`, `d`, `e`, all of which are required and strings.

*Rationale*: we can compare results of the previous single_field validator and see how having multiple rules affects validator's performance. A big drop in validation speed can indicate a poorly optimized system.

### array_of_objects

We pass a single field `a`, which is an array reference of hash references. There are 100 nested hashes in total. Each hash contains keys `b` - a number, and `c` - a string.

*Rationale*: We measure how efficiently validators can crawl a nested structure and whether they can deal with large amount of data. The amount of data can be configured by hand in `BenchmarkSetup` to see whether the performance decreases linearly or exponentially. This data can be used to decide whether a validator is fit for larger volume of data.

## Contributing

Contributions are welcome! If you wish to contribute a new validator, follow these steps:
1. Add your validator module into `cpanfile`. Run `carmel install` to update `cpanfile.snapshot`
2. Add a new benchmark runner in `lib/Utils.pm`. Name your benchmark `Bench<name>`, `<name>` being module name without `::` separators
3. Choose which benchmark case you would like to implement. Add your benchmark name into `BenchmarkSetup.pm` file in that directory (in `sub participants`)
4. Create a file in that directory named `Bench<name>.pm`. Implement validation code in that file
5. Ensure your validator works, then create a pull request

