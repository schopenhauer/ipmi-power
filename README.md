# ipmi-power

This is a web frontend to power cycle a remote machine using IPMI. The tool has been tested with the [Supermicro A2SDi-4C-HLN4F](https://www.supermicro.com/products/motherboard/atom/A2SDi-4C-HLN4F.cfm) motherboard.

## Usage

Set the following environment variables.

- `IPMI_HOST` (IP address or hostname)
- `IPMI_NAME` (server name)
- `IPMI_USERNAME` (username)
- `IPMI_PASSWORD` (password)

Install the gems, run the app.

```
bundle install
foreman start
```

## Configuration

You can specify your custom power on/off schedule in the `schedule.yml` file and enable/disable the feature using the `auto_power` flag.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
