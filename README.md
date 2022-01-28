# Benchmarks for form validators

These benchmarks measure:
- how fast input hashes matching the specification can be validated at runtime

These benchmarks don't (currently?) measure:
- validation failure speed
- compilation time overhead

Object construction is part of the benchmark, but can be skipped if certain validator implementation does not require it.

## Cases

Here is the list of current benchmark cases with rationales behind them:

### single_field

We pass a single field `a`, which is required and can be any scalar value.

*Rationale*: we measure the runtime overhead each system has. The validation rule here is as easy as it can be on purpose. Results of this benchmark can be used to decide whether a validator should be used for simple data validation cases that will run very frequently.

### custom_validator

We pass a single field `a`, which is a string value and must be shorter than 64 characters.

*Rationale*: since a code reference check based on length should have the same execution time no matter which validator runs it, we can measure how well validators fare with extending them with custom code.

*Note*: this benchmark is reserved for validators that can use a perl code reference to validate input. Preconfigured validators that check for string length are not allowed.

### array_of_objects

We pass a single field `a`, which is an array reference of hash references. There are 100 nested hashes in total. Each hash contains keys `b` - a number, and `c` - a string.

*Rationale*: We measure how efficiently validators can crawl a nested structure and whether they can deal with large amount of data. The amount of data can be configured by hand in `BenchmarkSetup` to see whether the performance decreases linearly or exponentially. This data can be used to decide whether a validator is fit for larger volume of data.

## Contributing

Contributions are welcome! If you wish to contribute a new validator, follow these steps:
1. Add your validator module into `cpanfile`. Run `carton install` to update `cpanfile.snapshot`
2. Add a new benchmark runner in `lib/Utils.pm`. Name your benchmark `Bench<name>`, `<name>` being module name without `::` separators
3. Choose which benchmark case you would like to implement. Add your benchmark name into `BenchmarkSetup.pm` file in that directory (in `sub participants`)
4. Create a file in that directory named `Bench<name>.pm`. Implement validation code in that file
5. Ensure your validator works, then create a pull request

