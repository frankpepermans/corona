String getImplClassName(String forClassName) => '_${forClassName}Impl';

String getSchemaName(String forClassName) => '_$forClassName\$';

String getLensName(String forClassName) => '${forClassName}LensExtension';

String getCtrTearOffName(String forClassName) =>
    '_${forClassName[0].toLowerCase().replaceFirst(r'<[^>]+>', '')}${forClassName.substring(1)}TearOff';

String getFactoryName(String forClassName) => '${forClassName}Factory';

String getCodecName(String forClassName) => '${forClassName}Codec';

String getCodecEncoderName(String forClassName) => '${forClassName}Encoder';

String getCodecDecoderName(String forClassName) => '${forClassName}Decoder';

String getReaderName(String forClassName) => 'read$forClassName';

String getWriterName(String forClassName) => 'write$forClassName';

String getLensPropertyName(String property) => '${property}Lens';
