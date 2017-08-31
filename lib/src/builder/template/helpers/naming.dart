String getImplClassName(String forClassName) => '_${forClassName}Impl';

String getSchemaName(String forClassName) => '_$forClassName\$';

String getLensName(String forClassName) => '${forClassName[0].toLowerCase()}${forClassName.substring(1)}Lens';

String getCtrTearOffName(String forClassName) => '_${forClassName[0].toLowerCase()}${forClassName.substring(1)}TearOff';

String getFactoryName(String forClassName) => '${forClassName}Factory';

String getReaderName(String forClassName) => 'read$forClassName';

String getWriterName(String forClassName) => 'write$forClassName';