# ipmi-power

This is a web frontend to power cycle a remote machine using [Intelligent Platform Management Interface](https://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface) (IPMI). The tool has been successfully tested with the [Supermicro A2SDi-4C-HLN4F](https://www.supermicro.com/products/motherboard/atom/A2SDi-4C-HLN4F.cfm) motherboard. It also includes a scheduler to automatically power the system on/off.

## Usage

Set the following environment variables:

- IP address or hostname: `IPMI_HOST`
- Server name: `IPMI_NAME`
- Username: `IPMI_USERNAME`
- Password: `IPMI_PASSWORD`

Install the gems, run the app.

```
bundle install
foreman start
```

## Configuration

You can specify your custom power on/off schedule in the `schedule.yml` file and enable/disable the feature using the `auto_power` flag (disabled by default).

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
