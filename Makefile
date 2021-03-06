NAME=spintest
VERSION=1.0.3
REVISION=0
PREFIX=/app/nate-test
TARGET_DIR=.
PACKAGE=$(NAME)_$(VERSION)-$(REVISION)_amd64.deb
POSTINSTALL=postinstall.sh

.PHONY: publish

clean:
	@rm -f $(PACKAGE) || true

test:
	@gem list rspec >/dev/null 2>&1 || gem install rspec --no-ri --no-rdoc 	
	@rspec

package: clean
	@fpm -s dir -t deb -d nginx -n $(NAME) -v $(VERSION) --iteration $(REVISION) --prefix $(PREFIX) -C $(TARGET_DIR) --after-install $(POSTINSTALL) . 

publish: package
	deb-s3 upload -b debs3test --s3-region=us-east-2 $(PACKAGE)
